class MachinesController < ApplicationController
  before_action :set_machine, only: [:show, :edit, :destroy]
  load_and_authorize_resource

  # GET /machines
  # GET /machines.json
  def index
    if current_user
      if (current_user.admin? || current_user.staff?)
        if params[:client_id]
          @client = User.find(params[:client_id])
          @machines = Machine
            .where(parent: nil)
            .where(user_id: params[:client_id])
            .order(:lmid)  
          ##@prospects = User.client.includes(:machines).where( :machines => { :user_id => nil } )
        else
          @machines = Machine.where(parent: nil).order(:lmid)
        end
        # Machines with no parents are parents
        @availables = Machine.available.where(parent: nil)
        @soldmachines = Machine.sold.where(parent: nil)
      else
        @machines = current_user.machines
        @availables = Machine.available.where(parent: nil)

      end
    else
      @machines = Machine.where(user_id: nil)
    end
  end

  # GET /machines/1
  # GET /machines/1.json
  def show
    
    if (current_user && (current_user.admin? || current_user.staff?))
      @children = Machine.where(parent: @machine.lmid)
      @potentials = Machine.where.not(lmid: @machine.lmid).
                            where.not(parent: @machine.lmid).
                            where(province_id: @machine.province_id).
                            where(city_id: @machine.city_id)
      @atn = TrackingNumber.where(machine_id: nil)
    end

    @title = @machine.specialty.name + " leads in " + @machine.city.name + ", " + @machine.province.abr
    @descr = @title

    @leadval = @machine.specialty.leadvalue

    @calls = @machine.tracking_numbers.first.calls if @machine.tracking_numbers.present?

    if @machine.city.population > 100000
      @citysize = "large"
      @minrate = 499
    else
      @citysize = "small"
      @minrate = 299
    end
    @calltarget = (@minrate / @leadval.to_f).ceil * 2

    @age = (Time.now.to_i - Time.at(@machine.created_at.to_i).to_i) / 60 / 60 / 24

    @u = User.where(role: %w['prospect', 'inactive', 'client'])

#    if @machine.callstats.present?  
#      @tdcv = @machine.callstats.last.map(&:calls)
#      @ndcv = @machine.callstats.last(3).map(&:calls)
#    end

    tdleadcost = @minrate / @tdcv.to_f
    ndleadcost = (@minrate * 3) / @ndcv.to_f

    tdleadcost > ndleadcost ? @leadcost = ndleadcost : @leadcost = tdleadcost


  end

  # GET /machines/new
  def new
    if params[:c]
      @machine  = Machine.new(
        user_id: params[:u],
        province_id: params[:p],
        city_id: params[:ci],
        category_id: params[:c],
        subcategory_id: params[:s],
        parent: params[:parent],
        )
    elsif params[:client_id]
      @machine  = Machine.new(user_id: params[:client_id])
    else
      @machine  = Machine.new
    end
    @cat      = Category.includes(:subcategories).order(:name)
    @subcat   = Subcategory.includes(:specialties).order(:name)
    @prov     = Province.includes(:cities).all
  end

  # GET /machines/1/edit
  def edit
    @cat      = Category.includes(:subcategories).order(:name)
    @subcat   = Subcategory.includes(:specialties).order(:name)
    @prov     = Province.includes(:cities).all
  end

  # POST /machines
  # POST /machines.json
  def create
    @machine = Machine.new(machine_params)

    respond_to do |format|
      if @machine.save
#        CreateStripePlanJob.perform_later @machine.id
        format.html { redirect_to @machine, notice: 'Machine was successfully created.' }
        format.json { render :show, status: :created, location: @machine }
      else
        format.html { render :new }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machines/1
  # PATCH/PUT /machines/1.json
  def update
    @machine = Machine.find_by_lmid(params[:id])

    respond_to do |format|
      if @machine.update(machine_params)
        UpdateStripePlanJob.perform_later @machine.lmid
        format.html { redirect_to @machine, notice: 'Machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @machine }
      else
        format.html { render :edit }
        format.json { render json: @machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machines/1
  # DELETE /machines/1.json
  def destroy
    @machine.destroy
    respond_to do |format|
      format.html { redirect_to machines_url, notice: 'Machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machine
      @machine = Machine.friendly.find(params[:id])
      @subs = Machine.where(parent: @machine.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machine_params
      params.require(:machine).permit(:user_id, :city_id, :province_id, :category_id, :subcategory_id, :specialty_id, :parent)
    end
end

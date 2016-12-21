class CitationSourcesController < ApplicationController
  before_action :set_citation_source, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /citation_sources
  # GET /citation_sources.json
  def index
    @citation_sources = CitationSource.all
  end

  # GET /citation_sources/1
  # GET /citation_sources/1.json
  def show
  end

  # GET /citation_sources/new
  def new
    @citation_source = CitationSource.new
  end

  # GET /citation_sources/1/edit
  def edit
  end

  # POST /citation_sources
  # POST /citation_sources.json
  def create
    @citation_source = CitationSource.new(citation_source_params)

    respond_to do |format|
      if @citation_source.save
        format.html { redirect_to @citation_source, notice: 'Citation source was successfully created.' }
        format.json { render :show, status: :created, location: @citation_source }
      else
        format.html { render :new }
        format.json { render json: @citation_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citation_sources/1
  # PATCH/PUT /citation_sources/1.json
  def update
    respond_to do |format|
      if @citation_source.update(citation_source_params)
        format.html { redirect_to @citation_source, notice: 'Citation source was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation_source }
      else
        format.html { render :edit }
        format.json { render json: @citation_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citation_sources/1
  # DELETE /citation_sources/1.json
  def destroy
    @citation_source.destroy
    respond_to do |format|
      format.html { redirect_to citation_sources_url, notice: 'Citation source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citation_source
      @citation_source = CitationSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_source_params
      params.require(:citation_source).permit(:site, :submissionurl, :da, :freesubmit)
    end
end

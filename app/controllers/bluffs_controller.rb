class BluffsController < ApplicationController
  before_action :set_bluff, only: [:show, :edit, :update, :destroy]

  # GET /bluffs
  # GET /bluffs.json
  def index
    @bluffs = Bluff.all
  end

  # GET /bluffs/1
  # GET /bluffs/1.json
  def show
  end

  # GET /bluffs/new
  def new
    @bluff = Bluff.new
  end

  # GET /bluffs/1/edit
  def edit
  end

  # POST /bluffs
  # POST /bluffs.json
  def create
    @bluff = Bluff.new(bluff_params)

    respond_to do |format|
      if @bluff.save
        format.html { redirect_to @bluff, notice: 'Bluff was successfully created.' }
        format.json { render :show, status: :created, location: @bluff }
      else
        format.html { render :new }
        format.json { render json: @bluff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bluffs/1
  # PATCH/PUT /bluffs/1.json
  def update
    respond_to do |format|
      if @bluff.update(bluff_params)
        format.html { redirect_to @bluff, notice: 'Bluff was successfully updated.' }
        format.json { render :show, status: :ok, location: @bluff }
      else
        format.html { render :edit }
        format.json { render json: @bluff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bluffs/1
  # DELETE /bluffs/1.json
  def destroy
    @bluff.destroy
    respond_to do |format|
      format.html { redirect_to bluffs_url, notice: 'Bluff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bluff
      @bluff = Bluff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bluff_params
      params[:bluff]
    end
end

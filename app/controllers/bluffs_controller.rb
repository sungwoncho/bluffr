class BluffsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_match
  before_action :set_bluff, only: [:show, :edit, :update, :destroy]

  # GET /bluffs
  # GET /bluffs.json
  def index
    @bluffs = @match.bluffs.sort(params[:rule]).paginate(page: params[:page], per_page: 5).decorate
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
    @bluff = @match.bluffs.new(bluff_params)

    respond_to do |format|
      if @bluff.save & current_user.authored_bluffs << @bluff
        format.html { redirect_to [@match, @bluff], notice: 'Bluff was successfully created.' }
        format.json { render :show, status: :created, location: [@match, @bluff] }
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
        format.html { redirect_to [@match, @bluff], notice: 'Bluff was successfully updated.' }
        format.json { render :show, status: :ok, location: [@match, @bluff] }
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
      format.html { redirect_to match_bluffs_url, notice: 'Bluff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bluff
      @bluff = @match.bluffs.find(params[:id])
    end

    def set_match
      @match = Match.find(params[:match_id]).decorate
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bluff_params
      params.require(:bluff).permit(:statement_1, :statement_2, :user_id)
    end
end

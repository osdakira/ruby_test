class UsersItemsController < ApplicationController
  before_action :set_users_item, only: [:show, :edit, :update, :destroy]

  # GET /users_items
  # GET /users_items.json
  def index
    @users_items = UsersItem.all
  end

  # GET /users_items/1
  # GET /users_items/1.json
  def show
  end

  # GET /users_items/new
  def new
    @users_item = UsersItem.new
  end

  # GET /users_items/1/edit
  def edit
  end

  # POST /users_items
  # POST /users_items.json
  def create
    @users_item = UsersItem.new(users_item_params)

    respond_to do |format|
      if @users_item.save
        format.html { redirect_to @users_item, notice: 'Users item was successfully created.' }
        format.json { render :show, status: :created, location: @users_item }
      else
        format.html { render :new }
        format.json { render json: @users_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_items/1
  # PATCH/PUT /users_items/1.json
  def update
    respond_to do |format|
      if @users_item.update(users_item_params)
        format.html { redirect_to @users_item, notice: 'Users item was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_item }
      else
        format.html { render :edit }
        format.json { render json: @users_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_items/1
  # DELETE /users_items/1.json
  def destroy
    @users_item.destroy
    respond_to do |format|
      format.html { redirect_to users_items_url, notice: 'Users item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_item
      @users_item = UsersItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_item_params
      params.require(:users_item).permit(:user_id, :item_id)
    end
end

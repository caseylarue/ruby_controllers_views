class UsersController < ApplicationController
  #will run this method before show, edit, update, destroy is called
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # shows all users, part of READ
  # GET /users
  # GET /users.json
  def index
    # puts "\n\n\n USER PATH", user_path, "\n\n\n"
    @users = User.all
  end

  # show individual user, part of READ
  # GET /users/1
  # GET /users/1.json
  def show
  end

  ## part the of the CREATE
  # creates a new user object and passes it to the new.html.erb where there is a form to create new users
  # GET /users/new
  def new
    @user = User.new
  end

  ## UPDATE in CRUD
  # GET /users/1/edit
  def edit
  end

  ## part the of the CREATE
  # when the form is submitted to create a new user it gets sent to the create method
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  ## UPDATE in CRUD
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # sets the user based on the id in the params, it can only be called by other methods and not by the user directly
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # always use a private function to determine which parameters we will allow to pass to our model
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :age)
    end
end

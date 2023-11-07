class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users, status: 200
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, status: 200
    else
      render json: {
        error: 'User not found'
      }
    end
  end

  def create
    user = User.new(
      name: user_params[:name], 
      password: user_params[:password]
    )

    if user.save
      render json: user, status: 200
    else
      render json: {
        error: 'Error Creating...'
      }
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(name: params[:name], password: params[:password])
      render json: 'User Record Updated Successfully'
    else
      render json: {
        error: 'User Not Found'
      }
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
      user.destroy
      render json: 'User deleted successfully'
    end
  end

  private
  def user_params
    params.require(:article).permit([
      :name,
      :password,
    ])
  end
end

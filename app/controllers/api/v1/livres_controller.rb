class Api::V1::LivresController < ApplicationController
  def index
    livres = Livre.all
    render json: livres, status: 200
  end

  def show
    livre = Livre.find_by(id: params[:id])
    if livre
      render json: livre, status: 200
    else
      render json: {
        error: 'Book not found'
      }
    end
  end

  def create
    livre = Livre.new(
      name: livre_params[:name],
      image: livre_params[:image],
      title: livre_params[:author],
    )
    if livre.save
      render json: livre, status: 200
    else
      render json: {
        error: 'Error Creating..'
      }
    end
  end

  def update
    livre = Livre.find_by(id: params[:id])
    if livre
      livre.update(
      name: params[:name],
      image: params[:image],
      title: params[:author],
      )

      render json: 'Book Record Updated Successfully'
    else
      render json: {
        error: 'Book Not Found'
      }
    end
  end
  def destroy
    livre = Livre.find_by(id: params[:id])

    if livre
      livre.destroy
      render json: 'Book has been deleted successfully'
    end
  end

  private
  def livre_params
    params.require(:livre).permit([
      :name,
      :image,
      :author,
    ])
  end
end

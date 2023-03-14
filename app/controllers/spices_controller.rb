class SpicesController < ApplicationController

 # GET /spices
 def index
    spices = Spice.all
    render json: spices
 end

 

 # POST /spices
 def create
    spices = Spice.create(spice_params)
    render json: spices, status: :created
end

# PATCH /plants/:id
def update
    spices = Spice.find_by(id: params[:id])
    if spices
        spices.update(spice_params)
        render json: spices
    else
        render json: { error: "Spice not found "}, status: :not_found
    end
end

# DELETE /plants/:id
def destroy
    spices = Spice.find_by(id: params[:id])
    if spices
        spices.destroy
        render json: {}
    else
        render json: { error: "Spice not found "}, status: :not_found
    end

end


private

def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end



end

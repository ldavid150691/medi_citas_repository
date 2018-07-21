class CustomerCoresController < ApplicationController
    def index
        #el controlador esta ligado con la vista
        #app/views/Users
        render 'index'
    end   
end

class CustomerUsersController < ApplicationController
    def call
        initModel
        render "login"
    end
    def login
        initModel
        #find login and Customer
        password = CustomerUser.select('scu."PASSWORD"').joins('scu join "customer"."CUSTOMER_CORE" ccc on ccc."ID_CUSTOMER"=scu."CUSTOMER_CORE_ID"').where('ccc.DOCUMENT_NUMBER':(params[:txtDocumentNumber]),'ccc.DOCUMENT_TYPE':(params[:sltDocomentType]))
        if !password.empty?
            if password[0].PASSWORD.eql?(params[:txtPassword])
                render 'home' ,layout:"home"  #redireccionar con layout incluido
            else
                @mensaje= "Contraseña a incorrrecta"
                @tipo="error"
                render 'login'
            end
        else
            @mensaje= "Usuario con el numero y tipo de documento no existe"
            @tipo="error"
            render 'login'
        end
    end    
    def rescuePass
        initModel
        render 'rescue_pass'
    end
    def initModel
        @documentType=DocumentType.all
        @action="login"
    end   
    def managePost
        if !params[:txthddAction].nil? && params[:txthddAction].eql?("login")
            login        
        end
        if !params[:txthddAction].nil? && params[:txthddAction].eql?("rescuePass")
            rescuePass        
        end
    end   
end
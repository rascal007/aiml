class PatientsController < ActionController::API
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
  end

    def new
        newPatient=Patient.new
        newPatient.name = params["name"]
        newPatient.address = params["address"]
        newPatient.age = params["age"]
        newPatient.phonenumber= params["phonenumber"] 
        newPatient.height=params["height"]
        newPatient.weight=params["weight"]
        newPatient.aadharnumber=params["aadharnumber"]
        newPatient.save

        data={}
        data["message"]="New Patient #{newPatient.name}  created"
        render json:data
  end

end

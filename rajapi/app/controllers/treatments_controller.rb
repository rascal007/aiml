class TreatmentsController < ActionController::API
  before_action :set_treatment, only: [:show, :update, :destroy]

  # GET /treatments
  # GET /treatments.json

  # Post request for a new Treatment
  def new
        newTreatment=Treatment.new
        newTreatment.description= params["description"]
        newTreatment.isdiagnosed=false
        aadharnumber=params["aadharnumber"]
        p=Patient.find_by_aadharnumber(aadharnumber)
        newTreatment.patient_id=p.id
        newTreatment.save

  end

end



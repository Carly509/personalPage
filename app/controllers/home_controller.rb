class HomeController < ApplicationController
  def index
   end

   def download_pdf
    send_file(
      "#{Rails.root}/public/resume.pdf",
      filename: "carly_tesnor_resume.pdf",
      type: "application/pdf"
    )
  end
  def all_project
  end
end

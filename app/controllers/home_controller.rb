class HomeController < ApplicationController
  def index
   end

   def download_pdf
    send_file(
      "#{Rails.root}/public/your_file.pdf",
      filename: "your_custom_file_name.pdf",
      type: "application/pdf"
    )
  end
  def all_project
  end
end

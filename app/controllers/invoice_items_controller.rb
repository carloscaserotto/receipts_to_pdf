class InvoiceItemsController < ApplicationController
    def index
      @invoice_items = InvoiceItem.all
    end
    def new
      @invoice_item = InvoiceItem.new
    end
  
    def create
      #byebug
      @invoice_item = InvoiceItem.new(invoice_item_params)
  
      if @invoice_item.save
        redirect_to @invoice_item
      else
        render :new, status: :unprocessable_entity
      end
    end
   
  
    def show
      @invoice_item = InvoiceItem.find(params[:id])
  
          respond_to do |format|
              format.html
              format.pdf do
                  render pdf: "Invoice No. #{@invoice.id}",
                  page_size: 'A4',
                  template: "invoices/show.html.erb",
                  layout: "pdf.html",
                  orientation: "Landscape",
                  lowquality: true,
                  zoom: 1,
                  dpi: 75
              end
          end
    end
  
    private
          
          def invoice_item_params
            params.require(:invoice_item).permit(:name, :description, :price, :qty, :invoice_id)
          end
      
  end

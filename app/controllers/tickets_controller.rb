class TicketsController < ApplicationController
    before_action :authenticate_user!
    before_action :can_create?, only: [:new, :create]
    before_action :set_cat, only: [:new, :create, :edit, :update]

    def index
        @tickets = current_user.owned_tickets.page(params[:page])
    end

    def show
        @ticket = Ticket.find(params[:id])
        authorize @ticket
    end

    def new
        @ticket = Ticket.new
    end

    def create
        @ticket = Ticket.new(ticket_create_params)
        @ticket.owner = current_user
        # puts get_cat_code
        # puts ticket_create_params
        @ticket.category = Category.find_by_code(ticket_create_params[:category_code])
        if @ticket.save
            flash[:notice] = 'تم انشاء الشكوي بنجاح و رفعها للقسم المختص.'
            redirect_to @ticket
        else
            render :new
        end
    end

    def edit
        @ticket = Ticket.find(params[:id])
        authorize @ticket
    end

    def update
        @ticket = Ticket.find(params[:id])
        authorize @ticket
        @ticket.update(ticket_update_params)
        if @ticket.save
            flash[:notice] = 'تم تعديل الشكوي بنجاج'
            redirect_to @ticket
        else
            render :edit
        end
    end

    def withdraw
        @ticket = Ticket.find(params[:id])
        authorize @ticket
        @ticket.handler = current_user
        @ticket.status = 1
        @ticket.save
        flash[:notice] = 'تم سحب التذكره بنجاح يمكنك العمل عليها الان.'
        redirect_to @ticket
    end


    private
    def ticket_create_params
        params.require(:ticket).permit(:title, :category_code, :description)
    end

    def ticket_update_params
        params.require(:ticket).permit(:status, :public_notes, :private_notes)
    end

    def set_cat
        @category_list = Category.all.map { |category| [category.name, category.code] }
    end

    # if there is an open ticket user cant create a new one
    def can_create?
        ticket = current_user.owned_tickets.first
        if ticket
            # ticket is opened
            if ticket.status == 0 or ticket.status == 1
                flash[:alert] = 'لديك تذكره مفتوحه, برجاء التواصل مع القائم علي حلها.'
                return redirect_to root_path
            end
        end
    end

end

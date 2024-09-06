class OrdersController < ApplicationController
  # Creando mis acciones CRUD
  def buy_book
    @order = Order.new
    @book = Book.find(params[:id])
  end

  def new
    @orders = Order.all.includes(:user, :book).where(user: current_user) # Cargar todos los pedidos con usuarios y libros asociados
    # raise
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to new_order_path
    else
      render :new
    end
  end
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'La orden fue actualizada exitosamente.'
    else
      render :edit
    end
  end
  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      head :no_content
    else
      render json: { error: 'No se pudo eliminar el pedido' }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :book_id, :quantity)
  end
end

class OrdersController < ApplicationController
  # Creando mis acciones CRUD
  # Index devolverá los pedidos de la bd y los asigna a la variable de instancia @orders
  def index
    @orders = Order.all
  end

  # Busca un pedido específico en la base de datos por su ID (params[:id])
  # Asigna el pedido encontrado a la variable de instancia @order.
  # Esta acción se utiliza para mostrar los detalles de un pedido en particular.
  def show
    @order = Order.find(params[:id])
  end

  # Crea un nuevo objeto Order vacío y lo asigna a la variable de instancia @order.
  # Esta acción se utiliza para mostrar el formulario que permite crear un nuevo pedido
  # Con la vista new.html.erb vamos a hacer el render del form
  def new
    @order = Order.new
  end

  # Crea un nuevo objeto Order basado en los parámetros del formulario (order_params)
  # Guardamos el nuevo objeto Order en la base de datos usando el método save
  # Si todo está ok, redirecciona a la página del pedido creado
  # Si hay un error, hace un render de new para que el usuario pueda corregir los errores
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: 'La orden fue creada exitosamente.'
    else
      render :new
    end
  end

  # Busca un pedido específico en la base de datos por su ID (params[:id])
  # Asigna el pedido encontrado a la variable de instancia @order
  def edit
    @order = Order.find(params[:id])
  end

  # Busca un pedido específico en la base de datos por su ID (params[:id])
  # Asigna el pedido encontrado a la variable de instancia @order
  # Intenta actualizar el objeto Order con los nuevos datos provenientes del formulario (order_params)
  # Si se actualiza con éxito, redirecciona a la página del pedido actualizado (redirect_to @order)
  # Si falla la actualización, vuelve a hacer render al view de edit para que el usuario pueda corregir los errores

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to @order, notice: 'La orden fue actualizada exitosamente.'
    else
      render :edit
    end
  end

  # Busca un pedido específico en la base de datos por su ID (params[:id]).
  # Elimina el pedido encontrado de la base de datos usando el método destroy
  # Redirecciona a la lista de pedidos (redirect_to orders_url)
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :book_id, :quantity)
  end
end

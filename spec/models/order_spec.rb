require "rails_helper"

RSpec.describe Order do


  context "new order in conflict with existing order whose status is accepted" do

    let(:user_owner) do
      User.create!({
        first_name:'Jabba',
        last_name:'LeHutt',
        email:'jabbalehutt@starwars.com',
        password:'jabbajabba',
        })
    end

    let(:user_buyer) do
      User.create!({
        first_name: 'Sebulba',
        last_name: 'LeDug',
        email: 'sebulba@starwars.com',
        password: 'sebulba'
        })
    end

    let(:product) do
      Product.create!({
        title: 'pull rose',
        category: 'Sweater',
        description: 'magnifique pull rose',
        address: '33 rue de lourmel Paris',
        price_cents: '2000',
        gender: 'Men',
        user_id: user_owner.id
      })
    end

    let(:new_product) do
      Product.create!({
        title: 'chemise verte',
        category: 'Shirt',
        description: 'magnifique chemise verte',
        address: 'rue imilchil Casablanca',
        price_cents: '200',
        gender: 'Unisex',
        user_id: user_owner.id
        })
    end

    let!(:existing_order) do
      Order.create!({
        start_date: Date.today,
        end_date: Date.today + 3,
        amount_cents: 3 * product.price_cents,
        product_id: product.id,
        user_id: user_buyer.id,
        status: "accepted"
        })
    end

    let!(:existing_order_pending) do
      Order.create!({
        start_date: Date.today,
        end_date: Date.today + 3,
        amount_cents: 3 * new_product.price_cents,
        product_id: new_product.id,
        user_id: user_buyer.id,
        status: "pending_acceptance"
        })
    end

    it "doesn't create the order if end date is before start date" do
      new_order = Order.new({
        start_date: Date.today - 2,
        end_date: Date.today - 4,
        amount_cents: 3 * product.price_cents,
        product_id: product.id,
        user_id: user_owner.id
        })
      expect(new_order.valid?).to eq(false)
    end



    it "doesn't create the new order if start date conflict with existing_order" do
      new_order = Order.new({
        start_date: Date.today + 1,
        end_date: Date.today + 4,
        amount_cents: 3 * product.price_cents,
        product_id: product.id,
        user_id: user_buyer.id
        })
      expect(new_order.valid?).to eq(false)
    end

    it "doesn't create the new order if end date conflict with existing order" do

      new_order = Order.new({
        start_date: Date.today - 1,
        end_date: Date.today + 2,
        amount_cents: 3 * product.price_cents,
        product_id: product.id,
        user_id: user_owner.id
        })
      expect(new_order.valid?).to eq(false)

    end

    it "does create the order if the dates are not in conflict" do
      new_order = Order.new({
        start_date: Date.today + 4,
        end_date: Date.today + 6,
        amount_cents: 3 * product.price_cents,
        product_id: product.id,
        user_id: user_owner.id
        })
      expect(new_order.valid?).to eq(true)
    end

    it "does create the order if the existing order is not accepted" do
      new_order = Order.new({
        start_date: Date.today,
        end_date: Date.today + 3,
        amount_cents: 3 * new_product.price_cents,
        product_id: new_product.id,
        user_id: user_buyer.id
        })
      expect(new_order.valid?).to eq(true)
    end

    it "updates the status to accepted if there are no conflicts" do
      existing_order.status = "accepted"
      expect(existing_order.valid?).to eq(true)
    end


  end
end

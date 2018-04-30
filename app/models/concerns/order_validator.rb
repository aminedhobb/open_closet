class OrderValidator < ActiveModel::Validator
  def validate(record)

    unless  record.start_date.nil? || record.end_date.nil?

      if record.start_date >= record.end_date
        record.errors.add(:end_date, 'must be after start date')
      end

      orders = record.product.orders.select { |order| order.status == "accepted"}
      unless orders.empty?
        orders.each do |order|
          unless order.id == record.id
            if order.start_date >= record.start_date && order.start_date <= record.end_date
              record.errors.add(:start_date, 'is not available')
            elsif order.end_date >= record.start_date && order.end_date <= record.end_date
              record.errors.add(:end_date, 'is not available')
            end
          end
        end
      end

    end
  end
end

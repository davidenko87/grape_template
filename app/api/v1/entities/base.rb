module CreativeWizard
  module V1
    module Entities
      class Base < Grape::Entity
        format_with(:human_readable_date) { |timestamp| Time.at(timestamp).strftime('%d-%m-%Y') unless timestamp.blank?  }
        format_with(:human_readable_datetime) { |timestamp| Time.at(timestamp).strftime('%d-%m-%Y %H:%M:%S %z') unless timestamp.blank? }
      end
    end
  end
end


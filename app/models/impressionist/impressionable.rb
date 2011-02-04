module Impressionist
  module Impressionable
    def is_impressionable
      has_many :impressions, :as=>:impressionable
      include InstanceMethods
    end
    
    module InstanceMethods
      def impressionable?
        true
      end
      
      def impression_count(start_date=nil,end_date=Time.now)
        start_date.blank? ? impressions.all.size : impressions.where("created_at>=? and created_at<=?",start_date,end_date).all.size
      end

      def unique_impression_count(start_date=nil,end_date=Time.now)
        start_date.blank? ? impressions.group(:ip_address).all.size : impressions.where("created_at>=? and created_at<=?",start_date,end_date).group(:ip_address).all.size
      end
    end
  end
end

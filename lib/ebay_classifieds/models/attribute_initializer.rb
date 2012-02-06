module EbayClassifieds
  module Models
    module AttributeInitializer
      def initialize(data = {})
        data.each do |k,v|
          send("#{k.to_s}=",v)
          #instance_variable_set("@#{k.to_s}",v)
        end
      end
    end
  end
end
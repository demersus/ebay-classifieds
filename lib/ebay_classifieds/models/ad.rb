module EbayClassifieds
  module Models
    class Ad  
      attr_accessor(:price, :locations, :status, :id, :title, :address, :attributes, :description, :category, :pictures, :modification_date_time, :start_date_time)
      include EbayClassifieds::ApiResource
      api_path '/ads'
      
      def initialize(data = {})
        data.each do |k,v|
          send("#{k.to_s}=",v)
          #instance_variable_set("@#{k.to_s}",v)
        end
      end
      
      def attributes
        @attributes || []
      end
      def pictures
        @pictures || []
      end
      
      def self.search(params = {})
        resp = api.get(api_path_join(params))
        data = resp.parsed_response['ads']
        #debugger
        EbayClassifieds::PaginatedCollection.new(
          data['ad'].collect do |ad| 
            new_from_api_data(ad)
          end,
          :page => params[:page] || 1,
          :per => params[:size] || 50,
          :total => (data['paging']['numFound'].to_i rescue 0)
        )
      end
      def self.find(id)
        resp = api.get(api_path_join("/#{id}"))
        resp.has_key?('ad') ? new_from_api_data(resp['ad']) : nil
      end
      def self.new_from_api_data(data)
        
          inst = new(:id => data['id'],
                      :title => data['title'],
                      :description => data['description'],
                      :status => data['ad-status'],
                      :category => Category.new_from_api_data(data['category']),
                      :start_date_time => (Time.parse(data['start_date_time']) rescue nil),
                      :modification_date_time => (Time.parse(data['modification_date_time']) rescue nil),
                      :address => AdAddress.new_from_api_data(data['ad-address']))
                      
          if data['price'] && data['price']['amount']
            inst.price = data['price']['amount'].to_f
          end
          if data['attributes'] && data['attributes']['attribute']
            inst.attributes = AdAttributes.new_from_api_data(data['attributes']['attribute'])
          end
          if data['pictures'] && data['pictures']['picture']
            pic_data = data['pictures']['picture']
            if pic_data.is_a? Array
              inst.pictures = pic_data.collect{|p| Picture.new_from_api_data(p)}.compact
            else
              inst.pictures = [Picture.new_from_api_data(pic_data)].compact
            end
          end
          inst
      end
    end
  end
end
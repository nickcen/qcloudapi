module Qcloudapi
  module Module
    class Yunsou < Qcloudapi::Module::Base

      ['DataManipulation', 'DataSearch'].each do |action|
        define_method action do |params|
          self.dispatchRequest(action, params, 'yunsou.api.qcloud.com', 'GET', '/v2/index.php')
        end
      end

      def add_docs(appId, docs)
        params = {
          'appId' => appId,
          'op_type' => 'add'
        }

        docs.each_with_index do |doc, idx|
          doc.each_pair do |key, value|
            params["contents.#{idx}.#{key}"] = value
          end
        end
        
        self.DataManipulation(params)
      end

      def del_docs(appId, doc_ids)
        params = {
          'appId' => appId,
          'op_type' => 'del'
        }

        doc_ids.each_with_index do |doc_id, idx|
          params["contents.#{idx}.doc_id"] = doc_id
        end

        puts params

        self.DataManipulation(params)
      end

      def query_docs(appId, search_query, page_id = 0, num_per_page = 20)
        params = {
          'appId' => appId,
          'search_query' => search_query,
          'page_id' => page_id,
          'num_per_page' => num_per_page
        }

        self.DataSearch(params)
      end
    end
  end
end

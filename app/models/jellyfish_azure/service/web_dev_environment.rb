module JellyfishAzure
  module Service
    class WebDevEnvironment < AzureService
      def provision
        credentials = product.provider.credentials
        @cloud_client = JellyfishAzure::Cloud::AzureClient.new credentials, product.provider.subscription_id

        operation = JellyfishAzure::Operation::WebDevEnvironmentProvision.new @cloud_client, product.provider, product, self
        operation.execute
      end
    end
  end
end

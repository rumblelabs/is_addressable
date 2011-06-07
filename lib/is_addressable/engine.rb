module IsAddressable
  class Engine < ::Rails::Engine #:nodoc:
    initializer 'engine.helper' do |app|
      ActionView::Base.send :include, AddressHelper
    end
  end
end

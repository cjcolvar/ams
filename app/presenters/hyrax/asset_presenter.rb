# Generated via
#  `rails generate hyrax:work Asset`
module Hyrax
  class AssetPresenter < Hyrax::WorkShowPresenter
    delegate :genre, :asset_types, :broadcast, :created, :copyright_date, :episode_number,
                         :description, :spatial_coverage, :temporal_coverage, :audience_level,
                         :audience_rating, :annotation, :rights_summary, :rights_link, :date, :local_identifier, :pbs_nola_code, :eidr_id, :topics, :subject, to: :solr_document
  end
end

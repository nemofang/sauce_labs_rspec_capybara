module PageObjects
  class SimilarItemsSection < SitePrism::Section
    elements :similiar_item_taxons, '#similar_items_by_taxon a'
  end
end

json.extract! book_type, :id, :book_name, :introduction, :img_paths, :catalog, :created_at, :updated_at
json.url book_type_url(book_type, format: :json)

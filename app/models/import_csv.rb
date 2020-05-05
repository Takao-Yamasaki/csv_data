# class ImportCsv < ApplicationRecord
#     #CSVデータのパスを引数として受け取り、インポート処理をする
#     #クラスメソッドの場合、new演算子がいらない
#     def self.import(path)
#         list = []
#         CSV.foreach(path,headers:true) do |row|
#             list << {
#                 name: row["name"],
#                 age: row["age"],
#                 address: row["address"]
#             }
#             User.create(list)
#         end
#     end
# end

class ImportCsv < ApplicationRecord
    def self.users_data
        path = File.join Rails.root,"db/csv/csv_data.csv"
        list = []
        CSV.foreach(path,headers:true) do |row|
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }
        end
        puts "インポート処理を開始"
        begin
            User.create!(list)
            puts "インポート完了！！"
        rescue ActiveModel::UnknownAttributeError => invalid
            puts "インポートに失敗：UnknownAttributeError"
        end
    end
end 
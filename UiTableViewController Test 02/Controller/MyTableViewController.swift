import UIKit

enum selectedScope:Int {
    case Ename = 0
    case Emenu = 1
    case Etype = 2
}

var myIndex = 0


class MyTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    let initialDataAry:[FoodStore] = FoodStore.generateModelArray()
    var dataAry:[FoodStore] = FoodStore.generateModelArray()
    
    var filteredData = [String]()
    
    var isSearching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "DIT 배달통"
         self.searchBarSetup()
        
        
    }
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["이름","음식","종류"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            dataAry = initialDataAry
            self.tableView.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
        case selectedScope.Ename.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.name.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope.Emenu.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.menu.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope.Etype.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.type.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        default:
            print("no type")
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return foodStoreNames.count
        
        if isSearching {
            return filteredData.count
        }
        
        return dataAry.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath) as! FoodStoreTableViewCell
        let model = dataAry[indexPath.row]
        cell.foodStoreCellName.text = model.name

        cell.foodStoreCellImage.image = UIImage(named: model.image)

        cell.foodStoreCellAddress.text = model.address
        cell.foodStoreCellTel.text = model.type
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        
        
//        let alert = UIAlertController(title: "얼러터", message: "기모띠", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "오케이", style: .default, handler: nil))
//        present(alert, animated: true, completion: nil)

    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController

                let model = dataAry[indexPath.row]

                
                destinationController.name = model.name
                // 이미지 넘기기
                destinationController.cellImage = model.image
                destinationController.local1 = model.address
                destinationController.tel1 = model.tel
                destinationController.menu = model.menu
                destinationController.type = model.type
                
            }
        } else if segue.identifier == "totalMapView" {
                let destinationController = segue.destination as! TotalMapViewController
                    destinationController.totalFoodStores = dataAry
        }
    }
}

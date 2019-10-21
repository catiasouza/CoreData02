

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //CRIAR ENTIDADE
       /* let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        //CONFIGURA OBJETO
        produto.setValue("Jamilton ", forKey: "nome")
        produto.setValue("jamiltonsouza", forKey: "login")
        produto.setValue(20, forKey: "idade")
        produto.setValue("12345", forKey: "senha")
        
        
        //SALVAR DADOS
        do {
            try context.save()
            print("Sucesso ao salvar dados")
        } catch  {
            print("Erro ao salvar dados")
        }*/
        
        
        //RECUPERAR PRODUTOS
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        do {
            let produtos = try context.fetch(requisicao)
            
            if produtos.count > 0 {
                for produto in produtos as! [NSManagedObject]{
                    if let descricao = produto.value(forKey: "descricao"){
                        if let cor = produto.value(forKey: "cor"){
                            if let preco = produto.value(forKey: "preco"){
                                 
                                print( String(describing: descricao) + "/"  + String(describing: cor) + "/" + String(describing: preco))
                            }
                        }
                    }
                }
            }else{
                print("Nenhum produto encontrado! ")
            }
        } catch  {
            print("Erro ao recuperar produtos")
        }
    }
    


}


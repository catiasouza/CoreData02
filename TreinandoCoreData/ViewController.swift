

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //CRIAR ENTIDADE
      /*  let produto = NSEntityDescription.insertNewObject(forEntityName: "Produto", into: context)
        
        //CONFIGURA OBJETO
        produto.setValue("Acer", forKey: "descricao")
        produto.setValue("Prata", forKey: "cor")
        produto.setValue(1500.90, forKey: "preco")
        
        
        
        //SALVAR DADOS
        do {
            try context.save()
            print("Sucesso ao salvar dados")
        } catch  {
            print("Erro ao salvar dados")
        }*/
        
        
        
        
        //RECUPERAR PRODUTOS
        
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Produto")
        
        //ORDENAR DE A - Z OU Z - A OU NUM
        let ordenacaoAZ = NSSortDescriptor(key: "descricao", ascending: true)
        
        //APLICAR FILTROS
        //let predicate = NSPredicate(format: "descricao == %@", "Dell")
        //let predicate = NSPredicate(format: "descricao contains [c] %@", "IPho")
        //let predicate = NSPredicate(format: "descricao beginswith [c] %@", "a")
        //let predicate = NSPredicate(format: "preco <= %@", "800")
        
        //let filtroDescricao = NSPredicate(format: "descricao contains [c] %@", "IPho")
        //let filtroPreco = NSPredicate(format: "preco <= %@", "800")
        //  let combinacaoFiltro = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroPreco,filtroDescricao])
        
     // let predicate = NSPredicate(format: "descricao == %@", "Dell")
        //APLICAR FILTRO NA REQUISICAO
        requisicao.sortDescriptors = [ordenacaoAZ]
      //  requisicao.predicate = predicate
        
        do {
            let produtos = try context.fetch(requisicao)
            
            if produtos.count > 0 {
                for produto in produtos as! [NSManagedObject]{
                    if let descricao = produto.value(forKey: "descricao"){
                        if let cor = produto.value(forKey: "cor"){
                            if let preco = produto.value(forKey: "preco"){
                                 
                                print( String(describing: descricao) + " | "  + String(describing: cor) + " | " + String(describing: preco))
                                
                                //REMOVER PRODUTO
                               /* context.delete(produto)
                                do{
                                    try context.save()
                                    print("Sucesso ao remover o produto")
                                }catch{
                                    print("Erro ao remover o produto")
                                }*/
                                
                                
                                // ATUALIZAR PRODUTO
                               /* produto.setValue("preto", forKey: "cor")
                                
                                do{
                                    try context.save()
                                    print("Sucesso ao atualizar o produto")
                                }catch{
                                    print("Erro ao atualizar o produto")
                                }*/
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


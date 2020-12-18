import Asset from './Asset';


export default class Image extends Asset{

    public nom: string;
    public lien: string;

    constructor(idAsset:number , Groupe_IdGroupe: number, nom: string,lien: string){
        super(idAsset,Groupe_IdGroupe);
        this.nom=nom;
        this.lien=lien;
    }

    get attribut(): Array < string> {
        return['idAsset','nom','lien','Groupe_IdGroupe'];
    }
    get select(): Array < string> {
        return['idAsset','nom','lien','Groupe_IdGroupe'];
    }

}
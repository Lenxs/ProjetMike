import User from'./User'


export default class Groupe{

    protected idGroupe: number | null;
    public nomGroupe: string;
    public nombrePersonne: number;
    public dateCreation: Date;
    protected User_idUser: number ;


    constructor(idGroupe: number| null, nomGroupe: string = '',nombrePersonne: number,dateCreation: Date, User_idUser: number){
        
        this.idGroupe= idGroupe;
        this.nomGroupe = nomGroupe;
        this.nombrePersonne = nombrePersonne;
        this.dateCreation = dateCreation;
        this.User_idUser=User_idUser;
    }

    get attribut(): Array < string> {
        return['idGroupe','nomGroupe','nombrePersonne', 'dateCreation', 'User_idUser'];
    }

    get stat(): string{
        return '\n nom du groupe '+this.nomGroupe+' \ndate de creation '+this.dateCreation+' '+this.idGroupe;
    }

    get nbMembre(): number{
        return this.nombrePersonne;
    }

    





}
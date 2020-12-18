import Asset from "./Asset";


export default class Video extends Asset{

   public lien: string;
   public nomVideo: string;
    
    constructor(Groupe_IdGroupe: number , idAsset: number, id: number, lien: string, nomVideo: string, idGroupe: number) {
        super(idAsset, Groupe_IdGroupe);
        this.lien = lien;
        this.nomVideo = nomVideo;
    }

    
}
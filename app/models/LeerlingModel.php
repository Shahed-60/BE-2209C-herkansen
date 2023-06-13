<?php

class LeerlingModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getLeerlingen()
    {

        $sql = "SELECT
            LEE.Voornaam,
            LEE.mobiel,
            LSP.Pakketnaam,
            LSP.AantalLessen,
            LSP.Prijs,
            LPP.StartDatumRijlessen,
            LPP.DatumRijbewijsBehaald
        FROM Leerling AS LEE
        INNER JOIN LesPakket AS LSP 
        ON LSP.Id = LEE.Id
        INNER JOIN LeerlingPerLesPakket AS LPP ON LPP.Id = LSP.Id
        ORDER BY StartDatumRijlessen ASC";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}

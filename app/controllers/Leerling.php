<?php

class Leerling extends BaseController
{
    private $leerlingModel;
    public function __construct()
    {
        $this->leerlingModel = $this->model('LeerlingModel');
    }
    public function index()
    {
        /**
         * Haal alle instructeurs op uit de database (model)
         */
        $Leerlingen = $this->leerlingModel->getLeerlingen();


        // $aantalInstructeurs = sizeof($instructeurs);

        /**
         * Maak de rows voor de tbody in de view
         */
        $tableRows = '';


        foreach ($Leerlingen as $Leerling) {

            $tableRows .=  "<tr>
                                <td>$Leerling->Voornaam</td>
                                <td>$Leerling->mobiel</td>
                                <td>$Leerling->Pakketnaam</td>
                                <td>$Leerling->AantalLessen</td>
                                <td>$Leerling->Prijs</td>
                                <td>$Leerling->StartDatumRijlessen</td>
                                <td>$Leerling->DatumRijbewijsBehaald</td>
                            </tr>";
        }
        /**
         * Het $data-array geeft alle belangrijke info door aan de view
         */
        $data = [
            'title' => 'Overzicht RijlesPakketten Leerlingen',
            'tableRows' => $tableRows
        ];

        $this->view('Leerling/index', $data);
    }
}

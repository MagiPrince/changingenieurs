CREATE DATABASE IF NOT EXISTS changingenieurs;

use changingenieurs;

CREATE TABLE IF NOT EXISTS fiche (
    fiche_id bigint AUTO_INCREMENT,
    salle varchar(128),
    millesime varchar(128),
    vinif_id varchar(128),
    encave varchar(128),
    cepage varchar(128),
    appelation varchar(128),
    volume varchar(128),
    sondage varchar(128),
    etat_san varchar(128),

    egrappage varchar(128),
    foulage varchar(128),
    operation_prefermentaire varchar(128),
    so_2 varchar(128),
    so_2_date varchar(128),
    collage varchar(128),
    collage_date varchar(128),
    adjuvants varchar(128),
    adjuvants_date varchar(128),
    enzymes varchar(128),
    enzymes_date varchar(128),
    levure varchar(128),
    levure_date varchar(128),
    chaptalisation varchar(128),
    chaptalisation_date varchar(128),
    soutirage varchar(128),
    soutirage_date varchar(128),
    stabilisation_chimique varchar(128),
    stabilisation_chimique_a varchar(128),
    desacidifie varchar(128),
    desacidifie_a varchar(128),
    mis_au_froid_le varchar(128),
    degaze varchar(128),
    prefiltrer varchar(128),
    mise_le varchar(128),

    PRIMARY KEY (fiche_id)
);


CREATE TABLE IF NOT EXISTS link (
    rfid_id bigint UNIQUE NOT NULL,
    fiche_id bigint UNIQUE NOT NULL,
    PRIMARY KEY (rfid_id),
    FOREIGN KEY (fiche_id) REFERENCES fiche(fiche_id)
);

CREATE TABLE IF NOT EXISTS evenements (
    evenement_id bigint AUTO_INCREMENT,
    fiche_id bigint NOT NULL,
    date_evenement varchar(128),
    evenement varchar(128) NOT NULL,
    cuve_id varchar(128),
    volumes varchar(128),
    visa varchar(128),

    PRIMARY KEY (evenement_id),
    FOREIGN KEY (fiche_id) REFERENCES fiche(fiche_id)
);

CREATE TABLE IF NOT EXISTS precedence (
    current_fiche bigint NOT NULL,
    prec_fiche bigint NOT NULL,
    PRIMARY KEY (current_fiche, prec_fiche),
    FOREIGN KEY (current_fiche) REFERENCES fiche(fiche_id),
    FOREIGN KEY (prec_fiche) REFERENCES fiche(fiche_id)
);

CREATE TABLE IF NOT EXISTS intrants (
    nom varchar(128) NOT NULL,
    expiration_date varchar(128),
    quantite varchar(128),
    
    PRIMARY KEY (nom)
);


INSERT INTO intrants (nom, expiration_date, quantite) VALUES ('coronavirus', "31/12/24", '212000');
INSERT INTO intrants (nom, expiration_date, quantite) VALUES ('vaccin', "4 jan", '0');
INSERT INTO intrants (nom, expiration_date, quantite) VALUES ('celui-ci', "02.24", '0');
INSERT INTO intrants (nom, expiration_date, quantite) VALUES ('celui-là', CURRENT_TIMESTAMP(), '0');
INSERT INTO intrants (nom, expiration_date, quantite) VALUES ('un autre', CURRENT_TIMESTAMP(), '0');
INSERT INTO intrants (nom, expiration_date, quantite) VALUES ('284B112', CURRENT_TIMESTAMP(), '0');

# some fake datas for "fiche"
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '10', '4f', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('12', '11', 'er', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '12', 'f4', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('1', '13', '6g', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('12', '14', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('12', '15', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('12', '16', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('12', '17', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '18', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '19', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '20', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '21', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '22', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '23', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '24', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '25', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '26', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '27', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '28', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '29', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '30', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '31', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '32', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '33', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '34', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '35', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '36', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '37', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '38', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');
INSERT INTO `changingenieurs`.`fiche` (`salle`, `millesime`, `vinif_id`, `encave`, `cepage`, `appelation`, `volume`, `sondage`, `etat_san`, `egrappage`, `foulage`, `operation_prefermentaire`, `so_2`, `so_2_date`, `collage`, `collage_date`, `adjuvants`, `adjuvants_date`, `enzymes`, `enzymes_date`, `levure`, `levure_date`, `chaptalisation`, `chaptalisation_date`, `soutirage`, `soutirage_date`, `stabilisation_chimique`, `stabilisation_chimique_a`, `desacidifie`, `desacidifie_a`, `mis_au_froid_le`, `degaze`, `prefiltrer`, `mise_le`) VALUES ('23', '39', '49', 'x', 'x', 'x', 'x', 'x', 'x', '10', '10', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x');

INSERT INTO link (rfid_id, fiche_id) VALUES (1, 1);
INSERT INTO link (rfid_id, fiche_id) VALUES (2, 2);
INSERT INTO link (rfid_id, fiche_id) VALUES (3, 3);
INSERT INTO link (rfid_id, fiche_id) VALUES (4, 4);
INSERT INTO link (rfid_id, fiche_id) VALUES (5, 5);
INSERT INTO link (rfid_id, fiche_id) VALUES (6, 6);
INSERT INTO link (rfid_id, fiche_id) VALUES (7, 7);
INSERT INTO link (rfid_id, fiche_id) VALUES (8, 8);
INSERT INTO link (rfid_id, fiche_id) VALUES (9, 9);
INSERT INTO link (rfid_id, fiche_id) VALUES (10, 10);
INSERT INTO link (rfid_id, fiche_id) VALUES (11, 11);
INSERT INTO link (rfid_id, fiche_id) VALUES (12, 12);
INSERT INTO link (rfid_id, fiche_id) VALUES (13, 13);
INSERT INTO link (rfid_id, fiche_id) VALUES (14, 14);
INSERT INTO link (rfid_id, fiche_id) VALUES (15, 15);
INSERT INTO link (rfid_id, fiche_id) VALUES (16, 16);
INSERT INTO link (rfid_id, fiche_id) VALUES (17, 17);
INSERT INTO link (rfid_id, fiche_id) VALUES (18, 18);
INSERT INTO link (rfid_id, fiche_id) VALUES (19, 19);
INSERT INTO link (rfid_id, fiche_id) VALUES (20, 20);
INSERT INTO link (rfid_id, fiche_id) VALUES (21, 21);
INSERT INTO link (rfid_id, fiche_id) VALUES (22, 22);
INSERT INTO link (rfid_id, fiche_id) VALUES (23, 23);
INSERT INTO link (rfid_id, fiche_id) VALUES (24, 24);
INSERT INTO link (rfid_id, fiche_id) VALUES (25, 25);

INSERT INTO precedence (current_fiche, prec_fiche) VALUES (26, 30); 
INSERT INTO precedence (current_fiche, prec_fiche) VALUES (4, 26); 
INSERT INTO precedence (current_fiche, prec_fiche) VALUES (3, 27); 
INSERT INTO precedence (current_fiche, prec_fiche) VALUES (2, 28); 
INSERT INTO precedence (current_fiche, prec_fiche) VALUES (1, 29); 

INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');
INSERT INTO `changingenieurs`.`evenements` (`fiche_id`, `date_evenement`, `evenement`, `cuve_id`, `volumes`, `visa`) VALUES ('5', NOW(), 'evene', '46', '6', 'vis');

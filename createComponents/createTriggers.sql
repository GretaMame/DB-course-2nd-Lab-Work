--Dalykine taisykle, uztikrinanti, kad klaseje nebutu daugiau nei 15 mokiniu.

CREATE FUNCTION grma3240.klasesMax() RETURNS "trigger" as
	'BEGIN
	IF (SELECT COUNT(*) FROM grma3240.Mokinys
	   WHERE grma3240.Mokinys.Klase = NEW.Klase)>14
	THEN
	   RAISE EXCEPTION ''Virsytas mokiniu skaicius kalseje.'';
	END IF;
	RETURN NEW;
	END;'
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER MaxMokiniuSkaiciusKlaseje
BEFORE INSERT OR UPDATE ON grma3240.Mokinys
FOR EACH ROW
EXECUTE PROCEDURE grma3240.klasesMax();

--Dalykine taisykle, mokinys nesimokytu daugiau nei 7 dalyku.
CREATE FUNCTION grma3240.maxDalyku() RETURNS "trigger" AS
	'BEGIN
	IF (SELECT COUNT(*) FROM grma3240.Tvarkarastis
	   WHERE grma3240.Tvarkarastis.Klases_pav = NEW.Klases_pav)>6
	THEN
	   RAISE EXCEPTION ''Virsytas maksimalus dalyku skaicius.'';
	END IF;
	RETURN NEW;
	END;'
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER MaxDalykuSkaicius
BEFORE INSERT OR UPDATE ON grma3240.Tvarkarastis
FOR EACH ROW
EXECUTE PROCEDURE grma3240.maxDalyku();

--Dalykine taisykle, neleidzianti priskirti mokiniui dalyko, kurio jo klase nesimokina
CREATE FUNCTION grma3240.existsSubject() RETURNS "trigger" AS
	'BEGIN
	IF
	   (WITH KlasesDalykai AS
		(SELECT Dalyko_nr FROM grma3240.Tvarkarastis
		WHERE grma3240.Tvarkarastis.Klases_pav IN (SELECT Klase FROM grma3240.Mokinys
		WHERE NEW.Mokinio_nr = grma3240.Mokinys.Nr))
	   SELECT COUNT(*) FROM KlasesDalykai WHERE NEW.Dalyko_nr = KlasesDalykai.Dalyko_nr) = 0
	THEN 
	   RAISE EXCEPTION ''Sio dalyko nemokoma sioje klaseje'';
	END IF;
	RETURN NEW;
	END;'
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER arGalimaMokytisDalyka
BEFORE INSERT OR UPDATE ON grma3240.Mokymasis
FOR EACH ROW
EXECUTE PROCEDURE grma3240.existsSubject();
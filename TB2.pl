symptom(Patient,demam) :- verify(Patient," Anda Sedang Demam (y/n) ?").

    symptom(Patient,bercak) :- verify(Patient," Anda Memiliki Bercak Merah (y/n) ?").

    symptom(Patient,skepala) :- verify(Patient," Anda Sedang Sakit Kepala (y/n) ?").

    symptom(Patient,pilek) :- verify(Patient," Anda Sedang Pilek (y/n) ?").

    symptom(Patient,mmerah) :- verify(Patient,"Anda Memiliki Konjungtivitis (Mata Merah) (y/n) ?").

    symptom(Patient,batuk) :- verify(Patient,"Anda Sedang Batuk (y/n) ?").

    symptom(Patient,sbadan) :- verify(Patient," Badan Terasa Sakit (y/n) ?").

    symptom(Patient,dingin) :- verify(Patient,"Anda Merasa Kedinginan (y/n) ?").

    symptom(Patient,stenggorokan) :- verify(Patient,"Tenggorakan Anda Sedang Sakit (y/n) ?").

    symptom(Patient,bersin) :- verify(Patient,"Anda Sering Bersin-bersin (y/n) ?").

    symptom(Patient,kelenjar) :- verify(Patient,"Kelenjar Anda Sedang Bengkak (y/n) ?").

    symptom(Patient,pencernaan):- verify(Patient,"Pencernaan Anda Sedang Bermasalah (y/n) ?").

	/*symptom(_,"Sorry, I don't seem to be able to diagnose the disease.").*/


    hypothesis(Patient,cacar_cair_atau_measles) :-
        symptom(Patient,demam),
        symptom(Patient,batuk),
        symptom(Patient,mmerah),
        symptom(Patient,pilek),
        symptom(Patient,bercak).


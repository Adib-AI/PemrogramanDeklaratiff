    hypothesis(Patient,rubella) :-
        symptom(Patient,demam),
        symptom(Patient,skepala),
        symptom(Patient,pilek),
        symptom(Patient,bercak).

    hypothesis(Patient,flu_tinggi_atau_serious_flu) :-
        symptom(Patient,demam),
        symptom(Patient,skepala),
        symptom(Patient,sbadan),
        symptom(Patient,mmerah),
        symptom(Patient,dingin),
        symptom(Patient,stenggorokan),
        symptom(Patient,pilek),
        symptom(Patient,batuk).

    hypothesis(Patient,flu_biasa_atau_cold) :-
        symptom(Patient,skepala),
        symptom(Patient,bersin),
        symptom(Patient,stenggorokan),
        symptom(Patient,pilek),
        symptom(Patient,dingin).

    hypothesis(Patient,gondok_atau_mumps) :-
        symptom(Patient,demam),
        symptom(Patient,kelenjar).

    hypothesis(Patient,cacar_air_atau_chickenpox) :-
        symptom(Patient,demam),
        symptom(Patient,dingin),
        symptom(Patient,sbadan),
        symptom(Patient,bercak).

    hypothesis(Patient,covid19) :-
	symptom(Patient,demam),
	symptom(Patient,dingin),
	symptom(Patient,skepala),
	symptom(Patient,pencernaan).

	hypothesis(_,"Anda Mungking Memiliki Penyakit, Tapi System Tidak Mengetahuinya").

    response(Reply) :-
        read(Reply),
        write(Reply),nl.

help :- write("Itu memulai Program, Ketikkan 'start' pada compile").

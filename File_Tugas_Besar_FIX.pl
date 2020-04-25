:- use_module(library(jpl)).
start :-sleep(0.4),
		write('-----------------------------------------------------------------'),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.2),
		write("###################||| MOBILE GANGGU |||#########################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write('-----------------------------------------------------------------'),nl,nl,nl,




		interface2.



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

ask(Patient,Question) :-
	write(Patient),write(', Apakah '),write(Question),
	/*read(N),
	( (N == yes ; N == y ; N == Y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail),*/

	interface(',Apakah',Patient,Question),
	write('Loading.'),nl,
	sleep(1),
	write('Loading..'),nl,
	sleep(1),
	write('Loading...'),nl,
	sleep(1),
    nl.

:- dynamic yes/1,no/1.

verify(P,S) :-
   (yes(S)
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


pt(Patient):-

		hypothesis(Patient,Disease),
		interface3(Patient,', Anda Kemungkinan Positif ',Disease,'.'),
        write(Patient),write(','),write(Disease),write('.'),undo,end.

end :-
		nl,nl,nl,
		sleep(0.7),

		write('*****************************************************************'),nl,
		sleep(0.4),
		write("################||| THANK YOU FOR USE ME |||#####################"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['PENGECEKAN PENYAKIT'], F),
	jpl_new('javax.swing.JLabel',['MOBILE GANGGU'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [300,75], _),
	jpl_call(F, setSize, [800,600], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _),
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).

interface2 :-
	jpl_new('javax.swing.JFrame', ['PENGECEKAN PENYAKIT'], F),
	jpl_new('javax.swing.JLabel',['MOBILE GANGGU'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [300,75], _),
	jpl_call(F, setSize, [800,600], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,'HELLO BOCIL, SIAPA NAMA MU ?'], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(null)
		->	write('BOCIL Have been cancelled'),interface3('OK ','KAMU ','TELAH MENCALLED ','SYSTEM'),end,fail
		;	write("Hi. How are you? First of all tell me your name please : "),write(N),nl,pt(N)
	).


interface3(P,W1,D,W2) :-
	atom_concat(P,W1, A),
	atom_concat(A,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['PENGECEKAN PENYAKIT'], F),
	jpl_new('javax.swing.JLabel',['MOBILE GANGGU'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [300,75], _),
	jpl_call(F, setSize, [800,600], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _),
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).

help :- write("Itu memulai Program, Ketikkan 'start' pada compile").











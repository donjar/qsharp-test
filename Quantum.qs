namespace Quantum.Bell {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation MakeBell(q1: Qubit, q2: Qubit): Unit {
        ResetAll([q1, q2]);
        H(q1);
        CNOT(q1, q2);
    }

    operation SuperdenseCoding(a: Result, b: Result): (Result, Result) {
        using ((q1, q2) = (Qubit(), Qubit())) {
            MakeBell(q1, q2);

            if (a == One) {
                Z(q1);
            }
            if (b == One) {
                X(q1);
            }

            CNOT(q1, q2);
            H(q1);

            let x = M(q1);
            let y = M(q2);

            ResetAll([q1, q2]);

            return (x, y);
        }
    }
}

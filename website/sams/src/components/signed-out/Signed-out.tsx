import { auth } from "@/app/firebase";
import { useAuthState } from "react-firebase-hooks/auth";
import { ReactNode } from "react"

type Props = {
    children : ReactNode
};

export const Signedout = ({children} : Props) => {
    const [user] = useAuthState(auth);
     
    if(user) return null;

    return <>{children}</>
}
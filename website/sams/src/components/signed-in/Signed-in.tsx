import { auth } from "@/app/firebase";
import { useAuthState } from "react-firebase-hooks/auth";
import { ReactNode } from "react"

type Props = {
    children : ReactNode
};

export const SignedIn = ({children} : Props) => {
    const [user] = useAuthState(auth);
     
    if(!user) return null;

    return <>{children}</>
}
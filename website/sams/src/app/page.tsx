import Image from "next/image";
import Link from "next/link";
import { SignedIn } from "@/components/signed-in/Signed-in";
import { Signedout } from "@/components/signed-out/Signed-out";
import { useAuthState, useSignOut } from "react-firebase-hooks/auth";
import {auth} from "./firebase"
import { IconFidgetSpinner } from "@tabler/icons-react";


export default function Home() {

  const [user, loading] = useAuthState(auth);
  const [signOut] = useSignOut(auth);


  return (
<div>
  <h1>Next JS + Firebase Auth</h1>
{
  loading ? (
    <IconFidgetSpinner className=" animate-spin w-12 h-12 mx-auto"/>
  ) : (
    <SignedIn>

      <div className=" flex flex-col ">
        <h1 className=" text-3xl font bold"> Signed in as </h1>
        {
          user?.isAnonymous ? (
            <p>Anonymous</p>
          ) : (
            <>
            <p>{user?.email}</p>
            <p>
              Email Verified: {" "}
              {user?.emailVerified ? (
                <span className=" text-green-500"> Verified</span>
              ) : (
                <span className=" text-red-500"> Not Verified</span>
              )}
            </p>
            </>
          )
        }
        <button onClick={signOut} className="text-red-500 font bold">Sign Out</button>

      </div>
    </SignedIn>
  )
}
<Signedout>
<Link href={"/sign-in"} className="mr-4 underline">Sign in</Link>

<Link href={"/sign-up"} className="mr-4 underline">Create Account</Link>
</Signedout>
</div>
  );
}

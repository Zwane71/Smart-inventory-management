"use client"
import React from 'react'
import {useAuthState} from 'react-firebase-hooks/auth'
import { auth } from '@/app/firebase/config';
import { useRouter } from "next/navigation";
import { signOut } from 'firebase/auth';

const Dashboard = () => {
    const [user] = useAuthState(auth);
    const router = useRouter();
    const userSession = sessionStorage.getItem('user')
  
    if(!user && !userSession) {
      router.push("/")
    }
    console.log(user)
  
  return (
    <div className='flex  flex-col'>
        
        Dashboard
        <button onClick={()=> {
          signOut(auth)
           sessionStorage.removeItem('user') 
          }}>Sign Out</button>
    </div>
  )
}

export default Dashboard
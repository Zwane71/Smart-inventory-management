"use client";
import { useState } from "react";
import { useSignInWithEmailAndPassword } from "react-firebase-hooks/auth";
import { auth } from "../../firebase/config"; // Make sure this points to your Firebase config file
import { useRouter } from "next/navigation";
import { signInWithPopup, GoogleAuthProvider } from "firebase/auth";
import Link from "next/link";

const SignInForm = () => {
  // State for email and password inputs
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const router = useRouter();

  //Sign in with Google
  const googleAuth = new GoogleAuthProvider();
 
  const login = async () => {
    const result = await signInWithPopup(auth, googleAuth)
  }

  // Firebase hook to sign in user
  const [signInWithEmailAndPassword, user, loading, errorFromFirebase] = useSignInWithEmailAndPassword(auth);

  const handleSubmit = async (e) => {
    e.preventDefault(); // Prevent page reload on form submit

    try {
      const res = await signInWithEmailAndPassword(email, password);
      console.log("User signed in successfully:", res);
      sessionStorage.setItem('user', true)
      setEmail(' ');
      setPassword(' ')
      router.push("/dashboard")
      // You can add redirect logic here or do something else on successful login
    } catch (error) {
      console.error(error); 
      setError(error.message || "Failed to sign in. Please try again.");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="bg-[#d9d9d9] bg-opacity-15 border border-white border-10 p-8 rounded-lg shadow-md w-96">
        <h2 className="text-2xl font-bold text-center mb-6 text-black">Sign In</h2>

        {/* Display error message if there is one */}
        {error && <p className="text-red-500 text-center mb-4">{error}</p>}

        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label htmlFor="email" className="block text-sm font-semibold text-gray-700 mb-2">
              Email
            </label>
            <input
              type="email"
              id="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter your email"
              required
            />
          </div>

          <div className="mb-4">
            <label htmlFor="password" className="block text-sm font-semibold text-gray-700 mb-2">
              Password
            </label>
            <input
              type="password"
              id="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter your password"
              required
            />
          </div>

            <div className="flex flex-col  justify-center items-center gap-5">
              <button
                        type="submit"
                        className="w-36  py-2 px-4 bg-[#319f43] text-white font-semibold rounded-lg  "
                        disabled={loading} // Disable the button while loading
                      >
                        {loading ? "Signing In..." : "Sign In"}
                      </button>
            <div className=" border-b-4 w-full text-center">
                      OR
                      
            </div>
               <div className=" flex flex-col w-full justify-between gap-5">
               <button onClick={login} className="w-full  py-2 px-4 bg-[#4f909e] text-white font-semibold rounded-lg ">
                Continue with Google 
               </button>
               <span className="text-center">
                Don't have an account? <Link className="text-green-800 hover:text-white" href={"/sign-up"}>Sign Up</Link>
               </span>
               </div>
            </div>
        </form>
      </div>
    </div>
  );
};

export default SignInForm;

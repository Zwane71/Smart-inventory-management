"use client";
import { useState } from "react";
import { useCreateUserWithEmailAndPassword } from "react-firebase-hooks/auth";
import { auth } from "../../firebase/config";
import { useRouter } from "next/navigation";
import  Link  from "next/link";
import { updateProfile } from "firebase/auth"; // Import updateProfile from Firebase

const SignUpForm = () => {
  // State for the email, password, confirm password, and displayName
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [displayName, setDisplayName] = useState(""); // New state for displayName
  const [error, setError] = useState("");
  const router = useRouter();

  // Firebase Hook to create user
  const [createUserWithEmailAndPassword] = useCreateUserWithEmailAndPassword(auth);

  const handleSubmit = async (e) => {
    e.preventDefault(); // Prevent form from refreshing the page

    // Check if passwords match
    if (password !== confirmPassword) {
      setError("Passwords do not match!");
      return;
    }

    try {
      const res = await createUserWithEmailAndPassword(email, password);

      // Once the user is created, update their display name
      await updateProfile(res.user, {
        displayName: displayName, // Set the display name
      });

      console.log({ res });
      sessionStorage.getItem('user', true);
      // Reset fields after successful sign up
      setEmail("");
      setPassword("");
      setConfirmPassword("");
      setDisplayName(""); // Clear displayName field
      setError(""); // Clear error on success
      router.push('/dashboard');
    } catch (e) {
      setError(e.message || "An error occurred. Please try again.");
      console.error(e);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center">
      <div className="bg-[#d9d9d9] bg-opacity-15 border border-white border-10 p-8 rounded-lg shadow-md w-96">
        <h2 className="text-2xl font-bold text-center mb-6 text-black">Sign Up</h2>

        {/* Display error message if there is one */}
        {error && <p className="text-red-500 text-center mb-4">{error}</p>}

        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label htmlFor="displayName" className="block text-sm font-semibold text-gray-700 mb-2">
              Display Name
            </label>
            <input
              type="text"
              id="displayName"
              value={displayName}
              onChange={(e) => setDisplayName(e.target.value)}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Enter your display name"
              required
            />
          </div>

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

          <div className="mb-6">
            <label htmlFor="confirmPassword" className="block text-sm font-semibold text-gray-700 mb-2">
              Confirm Password
            </label>
            <input
              type="password"
              id="confirmPassword"
              value={confirmPassword}
              onChange={(e) => setConfirmPassword(e.target.value)}
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
              placeholder="Confirm your password"
              required
            />
          </div>

          <div className="flex flex-col gap-5 items-center justify-center">
            <button
              type="submit"
              className="w-36 justify-center py-2 px-4 bg-[#319f43] text-white font-semibold rounded-lg"
            >
              Sign Up
            </button>
            <span className="text-center">
              Already have an account? <Link className="text-green-800 hover:text-white" href={"/sign-in"}>Sign In</Link>
            </span>
          </div>
        </form>
      </div>
    </div>
  );
};

export default SignUpForm;

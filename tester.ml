#use "compiler.ml";;
#use "tests.ml";;
open Scanf;;

exception X_test_failed of string;;



  (* Test that the program correctly prints to a file *)
  let test_print_to_file input =
    (* Create a test file name and contents to print to the file *)
    let test_file_name = "testing/goo.asm" in
    let test_file_contents = input in


  Code_Generation.compile_scheme_string test_file_name test_file_contents 
  
       
  
    let rec read_lines ic =
      try
        let line = input_line ic in
        (*print_endline line;*)
        line ^ read_lines ic;
      with End_of_file -> ""
  
  let func input expected_success expected_result =
    test_print_to_file input;
    let cmd = "make ./testing/goo" in
    Sys.command cmd;
    let cmd2 = "./testing/goo" in
    let ic = Unix.open_process_in cmd2 in 
    let ans = read_lines ic in
    print_endline ans;
    let bool = (compare ans "#f!!! Used 952 bytes of dynamically-allocated memory") in
    print_int bool;
    ignore (Unix.close_process_in ic);
    try let result = ans in
      if true then
              if result = expected_result then ()
              else
                raise (X_test_failed (Printf.sprintf "\nString: %s\n" input))
      else
        raise (X_test_failed (Printf.sprintf "\nString: %s\n" input))
    with
    |X_syntax(syntax_err) ->
      if expected_success then
        raise (X_test_failed (Printf.sprintf "\nString: %s\nResult: X_syntax(%s)\n" input syntax_err))
      else
        ()
    |X_this_should_not_happen(happened) ->
          raise (X_test_failed (Printf.sprintf "\nString: %s\nResult: X_this_should_not_happen(%s)\n" input happened));;


   let run_code_gen_tests (cg_tests : cg_success_test list) = 
    try
      let stub_result  = "" in
      let _ = Printf.printf "Running tests for semantic analyzer\n" in
      let _ = List.fold_left (fun _ (s_test : cg_success_test) -> func s_test.test true s_test.expected_result) () cg_tests in
      let _ = Printf.printf "Finished successfully\n" in
      ()
    with
    | X_test_failed(e) -> Printf.printf "\nError: Test Failed%s" e;;


      
  
  (* Run all tests *)
  let () =
    run_code_gen_tests cg_success_tests;



    
   

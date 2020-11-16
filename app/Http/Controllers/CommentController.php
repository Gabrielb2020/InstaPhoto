<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function save(Request $request) {
        // Validacion
        $validate = $this->validate($request, [
            'image_id' => 'integer|required',
            'content' => 'string|required'
        ]);
        // Recoger datos
        $image_id = $request->input('image_id');
        $content = $request->input('content');

        //Asigno los alores a minuevo objeto a guardar
        $user = auth()->user();

        $comments = new Comment();
        $comments->user_id = $user->id;
        $comments->image_id = $image_id;
        $comments->content = $content;

        //Guardar en base de datos
        $comments->save();

        return redirect()->route('image.detail', ['id' => $image_id])->with([
            'message' => 'Has comentado!!'
        ]);
    }

    public function delete($id){
        // Conseguir datos del usuario logueado
         
        $user = auth()->user();
        

        // Conseguir los datos y objeto del comentario

        $comment = Comment::find($id);

        // Comprobar si soy el dueño del comentario o de la publicacion
        if($user && ($comment->user_id == $user->id || $comment->image->user_id == $user->id)){
            $comment->delete();

            return redirect()->route('image.detail', ['id' => $comment->image->user_id])->with([
                'message' => 'Comentario eliminado correctamente'
            ]);

        }else{
            return redirect()->route('image.detail', ['id' => $comment->image->user_id])->with([
                'message' => 'El comentario no se ha eliminado'
            ]);
        }
    }
}

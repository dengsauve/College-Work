<?php

$title = "Home";
include 'includes/header.php';
include 'includes/functions.php';


$users = array('Dennis', 'Dave', 'Tom', 'Bret', 'Tim');
$user = $_POST['user'];

$db = db_connect();

$sql = "select * from articles order by modified_at DESC LIMIT 1";

$result = $db->query($sql);

mysqli_close( $db );

list($id, $name, $author, $article_text, $published_date, $created_at, $modified_at) = $result->fetch_row();

$timeAgoWords = time_elapsed_string($published_date);

?>

  <h1>Home Page</h1>

  <!--
  <section>
    <iframe src="https://giphy.com/embed/KOVlHmbBA09XO" class="giphy-embed" allowFullScreen></iframe>
  </section>
  -->

  <section class="home-form-group col-xs-12">
    <form action="index.php" method="post" class="col-md-6 col-md-offset-3 text-left">
      <div class="form-group">
        <label for="user">Choose a user:</label>
        <?php CreateSelectBox('user', $users, $user); ?>
      </div>
      <input type="submit" class="btn btn-primary" />
    </form>
  </section>

  <section class="col-xs-12 col-md-8">

    <article class="col-xs-12 well">
      <?php
      $newestArticle = <<<END_OF_ARTICLE

      <h2>$name</h2>
      <p>By: $author, $timeAgoWords</p>
      <p class="text-justify">$article_text</p>
      <p>Published On: $published_date</p>
      <p>Created On: $created_at</p>
      <p>Last Modified: $modified_at</p>

END_OF_ARTICLE;

      echo $newestArticle;


      ?>
    </article>

    <article class="col-xs-12 well">
      <h2>Blog Here</h2>
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at ante at sem condimentum consequat non quis lectus. Aenean ultricies, diam tincidunt dictum commodo, magna orci faucibus lorem, non eleifend nisi lectus vitae ex. Cras eget est eu nisi sodales consequat eget at nisi. Fusce convallis dignissim ante eu venenatis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur mi enim, bibendum et maximus eget, interdum nec lectus. Nullam efficitur, urna sed consectetur convallis, erat ex ultricies mi, sed rutrum sem risus sit amet enim. Etiam faucibus, justo nec mollis volutpat, lectus arcu hendrerit dui, eu ultricies nulla odio vitae turpis. Fusce nec arcu in lorem placerat ornare nec sed nunc. Sed dictum laoreet tempor. Pellentesque commodo tempus leo, at gravida ante congue nec.
      </p>

      <p>
        Possim lucilius nam no. Est at ubique semper, nam idque feugait patrioque ea. In usu meliore noluisse eleifend, prompta delectus tincidunt te qui. Eum id repudiare evertitur constituam, tota deserunt consequuntur no sed, ea eum odio scriptorem.
      </p>

      <p>
        Laoreet definiebas ex quo. Pro id dicit possit sapientem. Ei sit temporibus disputando, sed ex ludus aperiri nominati. Odio bonorum ut sed, vis nostro aliquip repudiandae te. Cu sit habeo vituperatoribus, eu vis vidit laoreet interesset.

        Qui et lucilius splendide, homero iisque suavitate qui no, te quo forensibus liberavisse. Usu commodo forensibus scriptorem id, vivendum qualisque et sea. Hendrerit democritum voluptaria vim cu, usu dicant aeterno efficiantur in. Insolens recteque an quo. Ex nec tibique expetenda consectetuer, te decore ancillae eam. Duo esse dolorum accommodare ne, quo erat admodum cu, ferri paulo semper ex sed. Sed stet probo persecuti eu, eruditi copiosae deseruisse mei eu.
      </p>
    </article>

  </section>
  <aside class="col-xs-12 col-md-4">

    <article class="col-xs-12 calendar-mini">
      <h2>Calendar</h2>
      <?php echo miniCalendar( date("n"), date("Y"), false) ?>
    </article>

  </aside>

<?php

include 'includes/footer.php';

?>
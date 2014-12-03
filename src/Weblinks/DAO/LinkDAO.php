<?php

namespace Weblinks\DAO;

use Weblinks\Domain\Link;

class LinkDAO extends DAO {

    /**
     * @var \Weblinks\DAO\UserDAO
     */
    protected $userDAO;

    public function setUserDAO($userDAO) {
        $this->userDAO = $userDAO;
    }

    /**
     * Returns a list of all links, sorted by id.
     *
     * @return array A list of all links.
     */
    public function findAll() {
        $sql = "select * from t_link order by lin_id desc";
        $result = $this->getDb()->fetchAll($sql);

        // Convert query result to an array of domain objects
        $entities = array();
        foreach ($result as $row) {
            $id = $row['lin_id'];
            $entities[$id] = $this->buildDomainObject($row);
        }
        return $entities;
    }

    public function save(Link $link) {
        $linkData = array(
            'lin_url' => $link->getUrl(),
            'lin_title' => $link->getTitle(),
        );

        if ($link->getId()) {
            // The link has already been saved : update it
            $this->getDb()->update('t_link', $linkData, array('lin_id' => $link->getId()));
        } else {
            // The link has never been saved : insert it
            $this->getDb()->insert('t_link', $linkData);
            // Get the id of the newly created link and set it on the entity.
            $id = $this->getDb()->lastInsertId();
            $link->setId($id);
        }
    }

    /**
     * Removes an article from the database.
     *
     * @param \MicroCMS\Domain\Article $article The article to remove
     */
    public function delete($id) {
        // Delete the article
        $this->getDb()->delete('t_link', array('link_id' => $id));
    }

    /**
     * Creates an Link object based on a DB row.
     *
     * @param array $row The DB row containing Link data.
     * @return \Weblinks\Domain\Link
     */
    protected function buildDomainObject($row) {
        $link = new Link();
        $link->setId($row['lin_id']);
        $link->setUrl($row['lin_title']);
        $link->setTitle($row['lin_url']);

        if (array_key_exists('usr_id', $row)) {
            // Find and set the associated author
            $userId = $row['usr_id'];
            $user = $this->userDAO->find($userId);
            $link->setUser($user);
        }

        return $link;
    }

}
